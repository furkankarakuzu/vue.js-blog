<template>
  <div>
    <div class="title"> <h3>Anasayfa</h3></div>
      <v-data-table
    :headers="headers"
    :items="getPosts"
    :items-per-page="5"
    class="elevation-1"
  ></v-data-table>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        headers: [
          { text: 'Başlık', value: 'title'},
          { text: 'Paylaşılma tarihi', value: 'tarih' },
          { text: 'Okunma Sayısı', value: 'reading' },
          { text: 'Kategorisi', value: 'category' },
        ],
      }
    },
    created(){
      //this.desserts.push(this.$store.state.postList)
    },
    computed : {
      getPosts(){
      return this.$store.state.postList
    }
    }
  }
</script>

<style>
.title{
  width: 100%;
  text-align: center;
  margin-top: 10px;
  margin-bottom: 10vh;
}
</style>