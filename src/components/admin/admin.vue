<template>
  <div>
      <v-app>
          <sidebar @isComponent="isComponent = $event"/>
          <active :name="isComponent"/>
          <footbar/>
      </v-app>
  </div>
</template>

<script>
import sidebar from './layouts/sidebar'
import active from './activeComponent'
import footbar from './layouts/footer'
export default {
    name:'admin',
    components : {
        sidebar,
        active,
        footbar
    },
    title : "Admin",
    data(){
        return{
            isComponent : ""
        }
    }
}
</script>

<style>

</style>