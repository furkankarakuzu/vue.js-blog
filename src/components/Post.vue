<template>
   <div class="text-center container ortala">
       <h1 class="baslik">{{posts.title}}</h1>
        <div class="row">
            <div class="col">
                <img src="../assets/img/2.jpg" alt="author" class="profil">
                <b class="author">Furkan Karakuzu</b>
            </div>
            <div class="col mt-4" style="font-size:13px">Paylaşılma tarihi {{posts.tarih}}</div>
            <div class="col" style="margin-top:10px">
                <a href="https://twitter.com/furkannkarakuzu" style="text-decoration:none" target="_blank">
                    <v-icon>mdi-twitter</v-icon>
                </a>
                <a href="https://www.linkedin.com/in/furkankarakuzu/" style="text-decoration:none" target="_blank">
                <v-icon>mdi-linkedin</v-icon>
                </a>
                <a href="https://github.com/furkankarakuzu" style="text-decoration:none" target="_blank">
                <v-icon>mdi-github</v-icon>
                </a>
            </div>
        </div>
        <br>
        <v-card style="display:inline-block" class="mt-6">
        <v-img class="white--text align-end" max-width="350px" height="auto" :src="require('../assets/img/'+posts.imgSrc)"></v-img>
        </v-card> 
        <br><br>
        <p class="metin" v-html="posts.content"></p>
        <br><br>
        <div class="row">
            <router-link :to="'/kategoriler/'+posts.category" class="col nav-link">{{posts.category}}</router-link>
            <div class="col">
                <a href="https://twitter.com/furkannkarakuzu" style="text-decoration:none" target="_blank">
                    <v-icon>mdi-twitter</v-icon>
                </a>
                <a href="https://www.linkedin.com/in/furkankarakuzu/" style="text-decoration:none" target="_blank">
                <v-icon>mdi-linkedin</v-icon>
                </a>
                <a href="https://github.com/furkankarakuzu" style="text-decoration:none" target="_blank">
                <v-icon>mdi-github</v-icon>
                </a>
            </div>
        </div>
   </div>
</template>

<script>
export default {
    computed : {
        posts(){
            return this.$store.getters.getPost(this.$route.params.id)
        }
    },
    title(){
        //this.post=this.$store.getters.getPost(this.postId)
        return this.posts.title
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Rubik&display=swap');
.ortala{
    width: 90%;
    background-color: rgb(241, 241, 241);
    margin-top: 50px;
    border-radius: 10px;
}
.baslik{
    font-family: 'Courier New', Courier, monospace;
    font-size: 10vh;
    letter-spacing:0px;
}
.profil{
width: 5vh;
height: 5vh;
border-radius: 150px;
-webkit-border-radius: 150px;
-moz-border-radius: 150px;
justify-content: center;
display: inline-block;
}
.author{
    display: inline-block;
    margin-left:12px ;
    margin-top: 8px;
    font-family: 'Rubik', sans-serif;
    font-size: 15px;
    color: rgb(46, 46, 46);
}
.postImg{
    width: 70vh;
    height : auto;
}
.metin{
    font-family: 'Baloo Tamma 2', cursive;
}
</style>