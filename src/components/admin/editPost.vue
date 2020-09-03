<template>
  <div>
    <div class="title"> <h3>Yazı Düzenle</h3></div>
      <v-data-table
    :headers="headers"
    :items="getPosts"
    :items-per-page="5"
    class="elevation-1"
  >
    <template v-slot:item.buton="{ item }">
        <v-btn v-model="item.buton" @click="openDialog(item.id)" icon><v-icon>{{editIcon}}</v-icon></v-btn>
      </template>
  </v-data-table>
  <v-app>
    <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="600px">
      <v-card>
        <v-card-title>
          <span class="headline">Yazı Düzenle</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="12">
                <v-text-field label="Yazı Başlığı" v-model="title" required></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field label="Yazı Açıklaması" v-model="descc"></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-select
                  :items="['vue', 'ingilizce', 'uzay', 'gundem','node','nuxt']"
                  label="Kategori"
                  v-model="category"
                  required
                ></v-select>
              </v-col>
              <v-col cols="12">
                <quillEditor v-model="content"/>
              </v-col>
            </v-row>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="closeDialog">İptal</v-btn>
          <v-btn color="blue darken-1" text @click="saveData">Kaydet</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
  </v-app>
  </div>
</template>

<script>
import { mdiSquareEditOutline} from '@mdi/js'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import {quillEditor} from 'vue-quill-editor'
import axios from 'axios'
  export default {
    components : {
      quillEditor
    },
    data () {
      return {
        dialog:false,
        editIcon : mdiSquareEditOutline,
        headers: [
          { text: 'Başlık', value: 'title'},
          { text: 'Paylaşılma tarihi', value: 'tarih' },
          { text: 'Okunma Sayısı', value: 'reading' },
          { text: 'Kategorisi', value: 'category' },
          { text: 'Yazıyı Düzenle!', value: "buton"}
        ],
        arr : null,
        id : null,
        title : '',
        category : '',
        descc : '',
        content : ''
      }
    },
    methods : {
      openDialog(event){
        this.dialog = true
        this.arr.forEach(item => {
          if(item.id===event){
            this.id=event
            this.title = item.title
            this.category = item.category
            this.descc = item.descc
            this.content = item.content
          }
        });
      },
      closeDialog(){
        this.dialog=false
        this.title = ''
        this.category = ''
        this.descc = ''
        this.content = ''
      },
      saveData(){
        axios.post('update.php',{
          id : this.id,
          title : this.title,
          category : this.category,
          descc : this.descc,
          content : this.content
        })
        .then(response=>{
          this.dialog=false
          alert('işlem başarılı'+response)
        })
        .cath(e=>{
          alert('bir hata ile karşılaşıldı'+e)
        })
      }
    },
    created(){
     this.arr = this.$store.state.postList
    },
    computed : {
      getPosts(){
      return this.$store.state.postList
    }
    }
  }
</script>

<style>

</style>