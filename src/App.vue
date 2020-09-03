<template>
<div>
<v-app>
  <header-app v-if="!isAdmin"/>
  <router-view></router-view>
  <pagination v-if="!pages"></pagination>
  <footer-app v-if="!isAdmin"/>
</v-app>
</div>
</template>

<script>
import headerApp from './components/layouts/header'
import footerApp from './components/layouts/footer'
import pagination from './components/pagination'
export default {
  name: 'App',
  components: {
    headerApp,
    footerApp,
    pagination
  },
  data: () => ({
    pages : false
  }),
  computed: {
    isAdmin(){
      var path = window.location.pathname.split('/')[1]
      if(path == 'admin' || path=='login'){
        this.$store.dispatch('initAuth')
        return true
      }
      return false
    },
  },
  created(){
    this.$store.dispatch('fetchData')
    this.$store.dispatch('searchData')
  },
  watch : {
    '$route'(){
      if('/post/'+this.$route.params.id == this.$route.path){
        this.pages=true
      }else{
        this.pages=false
      }
    }
  }
}
</script>

