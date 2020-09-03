<template>
<div class="container">
  <div v-if="$vuetify.breakpoint.xsOnly">
    <v-card class="float-left mt-6 mb-6 row ml-6" max-width="250" v-for="post in getPosts" :key="post.id">
      <router-link :to="'/post/'+post.id">
        <v-img class="white--text align-end" max-width="250px" height="200px" :src="require('../assets/img/'+post.imgSrc)">
          <div style="display:inline-block; background:rgba(0, 0, 0, 0.5)">
          <v-card-title style="color:white; word-break: keep-all; font-size:17px">{{post.title}}</v-card-title>
          </div>
        </v-img>
      </router-link>
      <router-link :to="'/kategoriler/'+post.category" class="categoryLink">
        <v-card-subtitle class="pb-0">{{post.category}}</v-card-subtitle>
      </router-link>
      <v-card-text class="text--primary">
        <div>{{post.descc}}</div>
      </v-card-text>
      <v-card-actions>
        <router-link :to="'/post/'+post.id" class="btn">
          <v-btn color="orange" text>Okumaya Devam Et</v-btn>
        </router-link>
      </v-card-actions>
    </v-card>
  </div>
  <div v-else>
    <v-card class="float-left mt-6 mb-6 row ml-6" max-width="350" v-for="post in getPosts" :key="post.id">
      <router-link :to="'/post/'+post.id">
        <v-img class="white--text align-end" max-width="350px" height="200px" :src="require('../assets/img/'+post.imgSrc)">
          <div style="display:inline-block; background:rgba(0, 0, 0, 0.5)">
          <v-card-title style="color:white; word-break: keep-all; font-size:17px">{{post.title}}</v-card-title>
          </div>
        </v-img>
      </router-link>
      <router-link :to="'/kategoriler/'+post.category" class="categoryLink">
        <v-card-subtitle class="pb-0">{{post.category}}</v-card-subtitle>
      </router-link>
      <v-card-text class="text--primary">
        <div>{{post.descc}}</div>
      </v-card-text>
      <v-card-actions>
        <router-link :to="'/post/'+post.id" class="btn">
          <v-btn color="orange" text>Okumaya Devam Et</v-btn>
        </router-link>
      </v-card-actions>
    </v-card>
  </div>
</div>
</template>

<script>
import {eventBus} from '../main'
export default {
  title:'Anasayfa',
  data(){
    return {
       PostList : this.$store.state.postList,
       posts : null
    }
  },
  methods : {
    
  },
  computed : {
    getPosts(){
        eventBus.$on("pageData",(data)=>{
          this.posts=data
        })
        return this.posts
      //return this.$store.state.postList
    }
  },
}
</script>

<style scoped>
.categoryLink{
  text-decoration: none;
}
.pagination {
}
.page-item {
}
</style>