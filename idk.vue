<template>
  <button @click="unenrollDevice">Unenroll Device</button>
</template>

<script>
export default {
  methods: {
    unenrollDevice() {
      // Replace this with your custom implementation to execute the shell script
      // Execute the unenroll_device.sh script
      console.log("Unenrollment successful!");
    }
  }
}
</script>
