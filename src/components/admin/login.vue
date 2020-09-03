<template>
  <v-app id="inspire">
    <v-main>
      <v-container
        class="fill-height"
        fluid
      >
        <v-row
          align="center"
          justify="center"
        >
          <v-col
            cols="12"
            sm="8"
            md="4"
          >
            <v-card class="elevation-12">
              <v-toolbar
                color="primary"
                dark
                flat
              >
                <v-toolbar-title>Giriş Ekranı</v-toolbar-title>
                <v-spacer></v-spacer>
              </v-toolbar>
              <v-card-text>
                <v-form>
                  <v-text-field
                    label="Kullanıcı Adı"
                    name="Kullanıcı Adı"
                    v-model="kullaniciadi"
                    prepend-icon="mdi-account"
                    type="text"
                  ></v-text-field>

                  <v-text-field
                    id="password"
                    label="Şifre"
                    name="Şifre"
                    v-model="sifre"
                    prepend-icon="mdi-lock"
                    type="password"
                  ></v-text-field>
                </v-form>
              </v-card-text>
              <v-card-actions>
                <p style="color:red" v-if="check==0">Kullanıcı adı veya şifre hatalı</p>
                <p style="color:green" v-else-if="check==1">Giriş başarılı</p>
                <v-spacer></v-spacer>
                <v-btn color="primary" @click="logIn">Giriş Yap</v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
  export default {
    title : 'Giriş Yap',
    data(){
        return{
            kullaniciadi : '',
            sifre : '',
            check:null
        }
    },
    methods : {
        logIn(){
              this.$store.dispatch("logIn",{
                kullaniciadi : this.kullaniciadi,
                sifre:this.sifre,
                check : this.check
              })
              .then(()=>{
                if(this.$store.state.check==1){
                  this.$router.push("/admin")
                }
                else{
                  this.check=0
                }
              })
            }
        }
  }
</script>