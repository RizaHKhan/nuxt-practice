<template>
  <div class="single-post-page">
    <section class="post">
      <h1>{{ loadedPost.title }}</h1>
      <div class="post-details">
        <div>Last Updated On {{ loadedPost.updatedDate }}</div>
        <div>Written By On {{ loadedPost.author }}</div>
      </div>
      <p>{{ loadedPost.content }}</p>
    </section>
    <section class="post-feedback">
      <a href="#">Email Feedback</a>
    </section>
  </div>
</template>

<script>
export default {
  fetch(context) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve({
          loadedPosts: {
            id: '1',
            title: 'Some title (ID: ' + context.route.params.id + ')',
            previewText: 'Some previewText',
            author: 'Riza Khan',
            updatedDate: new Date(),
            content: 'Some dummy text which is definitely not the preview text',
            thumbnail: 'http://bespokedealership.weebly.com/uploads/1/2/7/3/12738755/s160735769120586747_p5_i1_w300.png'
          }
        })
    }, 1500);
    }).then(data => {
      context.store.commit('setPosts', data.loadedPosts)
    }).catch(e => {
      context.error(new Error())
    })
  },
  computed: {
    loadedPosts() {
      return this.$store.getters.loadedPosts
    }
  }
}
</script>

<style scoped>
  .single-post-page {
  padding: 30px;
  text-align: center;
  box-sizing: border-box;
}

.post {
  width: 100%;
}

@media (min-width: 768px) {
  .post {
    width: 600px;
    margin: auto;
  }
}

.post-title {
  margin: 0;
}

.post-details {
  padding: 10px;
  box-sizing: border-box;
  border-bottom: 3px solid #ccc;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

@media (min-width: 768px) {
  .post-details {
    flex-direction: row;
  }
}

.post-detail {
  color: rgb(88, 88, 88);
  margin: 0 10px;
}

.post-feedback a {
  color: red;
  text-decoration: none;
}

.post-feedback a:hover,
.post-feedback a:active {
  color: salmon;
}
</style>

