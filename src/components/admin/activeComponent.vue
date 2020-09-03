<template>
  <div>
    <v-app>
        <v-main>
            <v-container class="px-4 py-0 fill-height" fluid>
                <v-row class="fill-height">
                    <v-col>
                        <transition name="fade">
                            <component :is="name"></component>
                        </transition>
                    </v-col>
                </v-row>
            </v-container>
        </v-main>
    </v-app>
</div>
</template>

<script>
import home from './home'
import addPost from './addPost'
import editPost from './editPost'
import deletePost from './deletePost'
export default {
 components : {
     home,
     addPost,
     editPost,
     deletePost
 },
 props : ["name"],
 methods : {
     cikis(){
         if(this.logout){
            this.$store.dispatch("logout")
         }
     }
 },
 computed : {
     logout(){
         if(this.name=="logout"){
             return true
         }else{
             return false
         }
     }
 },
    watch : {
        name(yeni){
            if(yeni=="logout"){
                this.cikis()
            }
        }
    }
}
</script>

<style>

</style>