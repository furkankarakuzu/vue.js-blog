import Home from "./components/Home"
import {store} from './store/store'
const Post = reslove => {
    require.ensure(["./components/Post"],()=>{
        reslove(require("./components/Post"));
    })
}

const categories = reslove => {
    require.ensure(["./components/categories"],()=>{
        reslove(require("./components/categories"));
    })
}

const search = reslove => {
    require.ensure(["./components/search"],()=>{
        reslove(require("./components/search"));
    })
}

const login = reslove => {
    require.ensure(["./components/admin/login"],()=>{
        reslove(require("./components/admin/login"));
    })
}

const admin = reslove => {
    require.ensure(["./components/admin/admin"],()=>{
        reslove(require("./components/admin/admin"));
    })
}

export const routes=[
    {path:'', component : Home},
    {path : '/post/:id', component : Post},
    {path : '/kategoriler/:categori', component : categories},
    {path : '/arama/:search', component : search},
    {path : '/login', component : login},
    {path : '/admin', component : admin, beforeEnter(to,from,next){
        if(store.getters.isLogin){
            next()
        }else{
            next("/login")
        }
    }},
    {path: "*" , redirect : "/"}
]