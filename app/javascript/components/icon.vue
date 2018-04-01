<template>
  <svg :class="classes">
    <use :xlink:href="url"></use>
  </svg>
</template>

<script>
export default {
  props: {
    id: {
      type: String,
      required: true,
    },
    classname: {
      type: String,
      default: '',
    },
  },

  computed: {
    classes() {
      return [
        'icon',
        `icon--${this.id}`,
        this.classname,
      ];
    },

    url() {
      return `${window.Cookr.paths.icons}#${this.id}`;
    },
  },
};
</script>
