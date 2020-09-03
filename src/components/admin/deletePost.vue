<template>
  <div>
    <div class="title"> <h3>Yazı Sil</h3></div>
      <v-data-table
    :headers="headers"
    :items="desserts[0]"
    :items-per-page="5"
    class="elevation-1"
  >
    <template v-slot:item.buton="{ item }">
        <v-btn @click="showPopup(item.id)" v-model="item.buton" icon><v-icon>mdi-delete</v-icon></v-btn>
    </template>
  </v-data-table>
  <v-app>
    <v-dialog
      v-model="dialog" max-width="290">
      <v-card>
        <v-card-title class="headline">Yazıyı silmek istiyor musunuz?</v-card-title>
        <v-card-text>
          Bu işlem silmek istediğiniz yazıyı tamamen siler ve geri dönüşü olmaz. Gerçekten silmek istiyor musunuz?
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="red darken-1" text @click="dialog = false">
            İptal
          </v-btn>

          <v-btn color="green darken-1" text @click="deletePost">
            Sil
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-app>
  </div>
</template>

<script>
import axios from 'axios'
  export default {
    data () {
      return {
        dialog : false,
        headers: [
          { text: 'Başlık', value: 'title'},
          { text: 'Paylaşılma tarihi', value: 'tarih' },
          { text: 'Okunma Sayısı', value: 'reading' },
          { text: 'Kategorisi', value: 'category' },
          { text: 'Yazıyı Sil!', value: "buton"}
        ],
        desserts: [
        ],
        postId : null
      }
    },
    created(){
      this.desserts.push(this.$store.state.postList)
    },
    methods : {
      showPopup(event){
        this.dialog=true
        this.postId=event
      },
      deletePost(){
        axios.post('delete.php',{id : this.postId})
        .then(response=>{
          alert('veri silindi'+response)
        }).catch(e=>{
          alert("bir hata ile karşılaşıldı"+e)
        })
        this.dialog=false
      }
    },
  }
</script>

<style>

</style>