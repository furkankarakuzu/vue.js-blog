<template>
  <div>
      <div class="title"> <h3>Yazı Ekle</h3></div>
      <form>
        <v-text-field v-model="title" label="Yazı Başlığı"></v-text-field>
        <v-text-field v-model="desc" label="Yazı Açıklaması"></v-text-field>
        <v-select v-model="select" :items="items" label="Kategori"></v-select>
        <v-file-input
          accept="image/png, image/jpeg, image/bmp"
          placeholder="Yazı Fotoğrafı.."
          prepend-icon="mdi-camera"
          label="Fotoğraf"
          name="photo"
          @change="onChange()"
        ></v-file-input>
        <quillEditor v-model="content"/>
        <v-btn class="mr-4" @click="submit">submit</v-btn>
        <v-btn @click="clear">clear</v-btn>
      </form>
      <img :src="selectedImage" alt="">
  </div>
</template>

<script>
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import {quillEditor} from 'vue-quill-editor'
import axios from 'axios'
export default {
  components : {
    quillEditor,
  },
  data(){
    return  {
        content : "",
        title: '',
        desc: '',
        select: '',
        selectedImage : null,
        items: [
        ],
      }
    },

    methods: {
      submit () {
        if(this.content==='' || this.title === '' || this.desc === '' || this.select==='')
        {
          alert('Boş yer bırakma gördüğün her boşluğa bir şeyler gir')
        }else{
          var tarih=new Date()
          var yil=tarih.getFullYear()
          var ay=tarih.getMonth()+1
          var gun=tarih.getDate()
          var saat=tarih.getHours()
          var dakika=tarih.getMinutes()
          var saniye=tarih.getSeconds()	
          let date = gun+"/"+ay+"/"+yil+" "+saat+":"+dakika+":"+saniye
          const formData = new FormData()
          formData.append('photo', this.selectedImage)
          formData.append('content', this.content)
          formData.append('title', this.title)
          formData.append('descc', this.desc)
          formData.append('category', this.select)
          formData.append('time', date)
          axios.post('db.php', formData,{
          }).then(()=>{
            alert('işlem başarılı')
            this.clear()
          }).catch(()=>{
            alert('bir takım problemler yaşandı ama önemli değil, bir daha ki sefer karşılaşmaman için çalışıyorum..')
          })
        }
      },
      onChange() {
        const file = event.target.files[0];
       /* this.selectedImage = URL.createObjectURL(file);
        console.log(this.selectedImage)*/
        this.selectedImage = file
      },
      clear () {
        this.title = ''
        this.desc = ''
        this.select = null
        this.content = ''
        this.selectedImage = null
      },
    },
    created(){
      const category = ['uzay','vue','ingilizce','gundem','nuxt','node']
      category.forEach(categories => {
        this.items.push(categories)
      });
    }
}
</script>

<style>
#editor-container {
  height: 375px;
}
</style>