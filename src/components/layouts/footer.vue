<template>
  <v-footer dark padless class="foot">
    <v-card class="flex" flat tile>
      <v-card-title class="blue-grey lighten-5 yazi">
        <p class="metin">Sosyal medya hesaplarım üzerinden benimle iletişime geçebilirsiniz.</p>
        <v-spacer></v-spacer>
        <v-btn v-for="iconz in icons" :key="iconz.icon" class="mx-4" dark icon style="background-color:black">
          <a :href="iconz.link" target="_blank" style="text-decoration:none"><v-icon size="24px">{{ iconz.icon }}</v-icon></a>
        </v-btn>
      </v-card-title>
      <v-card-text class="py-2 white--text text-center">
        {{ new Date().getFullYear() }} — <strong>Furkan Karakuzu</strong>
      </v-card-text>
    </v-card>
  </v-footer>
</template>

<script>
  export default {
    data: () => ({
      icons: [
        {icon : 'mdi-twitter', link : 'https://twitter.com/furkannkarakuzu'},
        {icon : 'mdi-linkedin', link : 'https://www.linkedin.com/in/furkankarakuzu/'},
        {icon : 'mdi-github', link : 'https://github.com/furkankarakuzu'}
      ]
    }),
  }
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Rubik&display=swap');
.foot{
    margin-top:40px;
}
.metin{
    font-family: 'Rubik', sans-serif;
    font-size: 12pt;
    font-weight: 100;
    word-break: keep-all;
}
.yazi{
    color:black
}
</style>>