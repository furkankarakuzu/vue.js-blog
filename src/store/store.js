import Vue from 'vue'
import Vuex from 'vuex'
import {router} from '../main'
Vue.use(Vuex)
import axios from 'axios'
export const store = new Vuex.Store({
    state : {
        postList : null,
        searchPostList : null,
        check : 0
    },
    getters : {
        getPostList(state){
            return state.postList
        },
        getPost: state => id =>{
            return state.postList.find(post => {return post.id==id})
        },
        getPostCategory: state => category =>{
            return state.postList.filter(post => {return post.category==category})
        },
        isLogin(state){
            return state.check !=0
        },
        getSearchPostList(state)
        {
            return state.searchPostList
        }
    },
    mutations : {
        fetchAllData(state, datas){
            state.postList = datas
        },
        searchAllData(state, datas){
            state.searchPostList = datas
        },
        setCheck(state,check){
            state.check=check
        },
        logoutCheck(state){
            state.check=0
            localStorage.removeItem("login")
            localStorage.removeItem("time")
        }
    },
    actions : {
        initAuth({commit, dispatch}){
            let check = localStorage.getItem("login")
            if(check){
                let time = localStorage.getItem("time")
                let nowTime = new Date().getTime()

                if(nowTime>=time){
                    dispatch("logout")
                } else {
                    commit("setCheck",1)
                    let timerSecond = time-nowTime
                    dispatch("setTimeOutLogout",timerSecond)
                    router.push("/admin")
                }
            }else {
               router.push('/login')
               return false
            }
        },
        /// ALL DATAS
        fetchData({commit}){
            axios.get('getDatas.php')
        .then(response=>{
            commit('fetchAllData', response.data)
        })
        },
        ////////////////////
        // SEARCH
        searchData({commit},datas){
            axios.post('search.php',{
                search : datas
            })
        .then(response=>{
            commit('searchAllData', response.data)
        })
        },
        //////////////////////////////////
        logIn({commit,dispatch},authData){
            return axios.post('login.php',{
                kullaniciadi : authData.kullaniciadi,
                sifre : authData.sifre
            })
            .then(response=>{
                
                if(response.data.length<1){
                    //hatalı giriş
                    authData.check=-1
                }else{
                    //başarılı giriş
                    commit("setCheck",1)
                    localStorage.setItem("login",1)
                    localStorage.setItem("time",new Date().getTime()+3600000)
                    //localStorage.setItem("time",new Date().getTime()+10000)
                    dispatch("setTimeOutLogout",3600000)
                }
            })
            .catch(e=>{console.log(e)})
        },
        logout({commit}){
            commit("logoutCheck")
            router.replace("/login")
        },
        setTimeOutLogout({dispatch}, time){
            setTimeout(() => {
                dispatch("logout")
            }, time);
        }
    }
})