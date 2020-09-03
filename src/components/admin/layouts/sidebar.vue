<template>
<div>
    <v-app-bar app color="primary" dark elevation="0">
        <v-app-bar-nav-icon v-if="!sidebarMenu" @click.stop="sidebarMenu = !sidebarMenu"></v-app-bar-nav-icon>
        <v-spacer></v-spacer>
        <v-btn @click="toggleTheme" color="primary" class="mr-2">{{buttonText}}</v-btn>
    </v-app-bar>
   <v-navigation-drawer 
            v-model="sidebarMenu" 
            app
            floating
            :permanent="sidebarMenu"
            >
            <v-list dense color="primary" dark>
                <v-list-item>
                    <v-list-item-action>
                        <v-icon @click.stop="sidebarMenu = !sidebarMenu">mdi-chevron-left</v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>
                            <h5 class="font-weight-thin">Yönetim Paneli</h5>
                        </v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
            </v-list>
            <v-list-item class="px-2" @click="toggleMini = !toggleMini">
                <v-list-item-avatar>
                    <v-icon>mdi-account-outline</v-icon>
                </v-list-item-avatar>
                <v-list-item-content class="text-truncate">
                    Furkan Karakuzu
                </v-list-item-content>
            </v-list-item>
            <v-divider></v-divider>
            <v-list>
                <v-list-item v-for="item in items" :key="item.title" link @click="sendToComponent(item.name)">
                        <v-list-item-icon>
                            <v-icon color="primary">{{ item.icon }}</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title class="primary--text">{{ item.title }}</v-list-item-title>
                        </v-list-item-content>
                </v-list-item>
            </v-list>
    </v-navigation-drawer>
</div>
</template>

<script>
import { mdiSquareEditOutline, mdiShapeSquarePlus } from '@mdi/js'
export default {
    data(){
        return {
            toggleMini : false,
            sidebarMenu : true,
            items: [
                { title:"Anasayfa", name:"home", icon:"mdi-home-outline" },
                { title:"Yazı Ekle", name:"addPost", icon:mdiShapeSquarePlus },
                { title:"Yazı Düzenle", name:"editPost", icon:mdiSquareEditOutline},
                { title:"Yazı Sil", name:"deletePost", icon:"mdi-delete" },
                { title:"Çıkış Yap", name:"logout", icon:"mdi-logout" },
            ],
        }
    },
    computed: {
        buttonText() {
            return !this.$vuetify.theme.dark ? 'Dark Mode' : 'Light Mode'
        }
    },
    created(){
        this.$emit("isComponent","home")
    },
    methods: {
    toggleTheme() {
        this.$vuetify.theme.dark = !this.$vuetify.theme.dark;      
    },
    sendToComponent(name){
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
        this.sidebarMenu = !this.sidebarMenu
      }
        this.$emit("isComponent",name)
    }
  }
}
</script>

<style>
.fade-enter-active, .fade-leave-active {
  transition-property: opacity;
  transition-duration: .25s;
}

.fade-enter-active {
  transition-delay: .25s;
}
</style>