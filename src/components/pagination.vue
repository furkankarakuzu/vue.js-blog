<template>
<div class="container">
    <div class="card-footer pb-0 pt-3">
        <pagination :items="exampleItems" @changePage="onChangePage" :pageSize="9"></pagination>
    </div>
</div>
</template>
 
<script>
import pagination from 'jw-vue-pagination'
import {eventBus} from '../main'
export default {
    components : {
        pagination
    },
    data() {
        return {
            pageOfItems: []
        };
    },
    methods: {
        onChangePage(pageOfItems) {
            this.pageOfItems = pageOfItems
            eventBus.$emit("pageData",this.pageOfItems)
        }
    },
    computed : {
        exampleItems(){
            if(this.$route.params.categori){
                return this.$store.getters.getPostCategory(this.$route.params.categori)
            }else if(this.$route.params.search){
                return this.$store.getters.getSearchPostList
            }else{
                return this.$store.state.postList
            }
        },
    },
    created(){
        if(this.$route.params.categori){
            return this.$store.getters.getPostCategory(this.$route.params.categori)
        }else if(this.$route.params.search){
            return this.$store.getters.getSearchPostList
        }else{
            return this.$store.state.postList
        }
    },
    watch : {
        '$route'(){
            eventBus.$emit("pageData",this.pageOfItems)
        }
    }
}
</script> 
 

<style>

</style>