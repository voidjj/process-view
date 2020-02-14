<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>

export default {
  data: function () {
    return {
      message: 'Waiting for messages...'
    }
  },
  created: function () {
    const vm = this
    this.$cable.subscriptions.create(
      { channel: 'StreamChannel' },
      {
        received: function (data) {
          vm.message = data.message
        }
      }
    );
  }
}
</script>
