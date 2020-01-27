<template>
  <div class="admin-post-page">
    <section class="update-form">
      <AdminPostForm :post="loadedPost"/>
    </section>
  </div>
</template>

<script>
import AdminPostForm from '@/components/Admin/AdminPostForm'
export default {
  layout: 'admin',
  components: {
    AdminPostForm
  },
  data() {
    return {
      loadedPost: {
        author: 'Riza Khan',
        title: 'My edited post',
        content: 'Super amazing content',
        thumbnailLink: 'https://thenypost.files.wordpress.com/2017/03/shutterstock.jpg?quality=80&strip=all'
      }
    }
  }
}
</script>

<style>
  .update-form {
    width: 90%;
    margin: 20px auto;
  }
  @media (min-width: 768px) {
    .update-form {
      width: 500px;
    }
  }
</style>