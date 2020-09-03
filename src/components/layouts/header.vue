<template>
<div>
  <div class="navbar navbar-expand-sm navbar-light mt-3">
    <button class="navbar-toggler" type="button" id="buton" data-toggle="collapse" data-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <h4 class="mt-2 mr-4" v-if="$vuetify.breakpoint.xsOnly"> <router-link class="nav-link nav-item" style="color:black" tag="a" to="/"><i>FK</i></router-link></h4>
    <h4 class="mt-2 ml-6" v-else> <router-link class="nav-link nav-item" style="color:black" tag="a" to="/"><i>Furkan Karakuzu</i></router-link></h4>
    <div class="collapse navbar-collapse" id="navbarSupportedContent2">
      <ul class="navbar-nav ml-auto mr-auto">
        <li class="nav-item dropdown mr-5">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <h4 class="float-left">Yazılım</h4>
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown" @click="tiklama">
            <router-link :to="categories.vue" tag="a" class="dropdown-item" >Vue.js</router-link>
            <router-link :to="categories.nuxt" tag="a" class="dropdown-item">Nuxt.js</router-link>
            <router-link :to="categories.node" tag="a" class="dropdown-item">Node.js</router-link>
          </div>
        </li>
        <li class="nav-item mr-5">
          <router-link :to="categories.ingilizce" tag="a" class="nav-link"><h4 class="float-left" @click="tiklama">İngilizce</h4></router-link>
        </li>
        <li class="nav-item mr-5">
          <router-link :to="categories.uzay" tag="a" class="nav-link"><h4 class="float-left" @click="tiklama">Uzay</h4></router-link>
        </li>
        <li class="nav-item mr-5">
          <router-link :to="categories.gundem" tag="a" class="nav-link"><h4 class="float-left" @click="tiklama">Gündem</h4></router-link>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Ara" v-model="aramaMetni" aria-label="Ara">
        <div @click="search">
        <router-link :to="'/arama/'+aramaMetni" tag="button" class="btn btn-outline-success my-2 my-sm-0" >Arama!</router-link>
        </div>
      </form>
    </div>
  </div>
</div>
</template>

<script>
export default {
  data(){
    return{
      aramaMetni : "",
      categories : {vue:'/kategoriler/vue',nuxt:'/kategoriler/nuxt', node:'/kategoriler/node', ingilizce : '/kategoriler/ingilizce', uzay:'/kategoriler/uzay', gundem:'/kategoriler/gundem'}
    }
  },
  methods : {
    tiklama(){
      var isMobile = {
        Android: function() {
            return navigator.userAgent.match(/Android/i);
        },
        BlackBerry: function() {
            return navigator.userAgent.match(/BlackBerry/i);
        },
        iOS: function() {
            return navigator.userAgent.match(/iPhone|iPod/i);
        },
        Opera: function() {
            return navigator.userAgent.match(/Opera Mini/i);
        },
        Windows: function() {
            return navigator.userAgent.match(/IEMobile/i);
        },
        any: function() {
            return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
        }
      }
      if(isMobile.any())
      {
        document.getElementById('buton').click()
      }
    },
    search(){
      this.$store.dispatch("searchData",{
        search : this.aramaMetni
      })
    }
  },
  watch : {
        '$route'(){
            if('/arama/'+this.$route.params.search != this.$route.path){
              this.aramaMetni=""
            }
        }
    }
  /*watch : {
      '$route' () {
      if(window.location.pathname.split('/')[1]=='kategoriler'){
        this.categories = {vue:'/vue',nuxt:'/nuxt', node:'/node', ingilizce : '/ingilizce', uzay:'/uzay', gundem:'/gundem'}
      }
      else{
        this.categories = {vue:'/kategoriler/vue',nuxt:'/kategoriler/nuxt', node:'kategoriler/node', ingilizce : '/kategoriler/ingilizce', uzay:'/kategoriler/uzay', gundem:'/kategoriler/gundem'}
      }
      }
    }*/ 
}
</script>

<style scoped>

</style>
