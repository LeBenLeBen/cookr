<template>
  <li v-on-clickaway="hide">
    <button :class="['nav__link btn btn--bare', { 'active': displayed }]" @click="toggle">
      <icon id="search" classname="icon--100" />
    </button>
    <transition name="fade">
      <div v-if="displayed" class="search">
        <div class="container">
          <div class="search__header">
            <input v-model.trim="query"
              ref="field"
              type="search"
              class="search__field field field--large"
              :placeholder="I18n.t('search.placeholder')"
              @keyup.down="moveDown"
              @keyup.up="moveUp"
              @keyup.enter="go">
          </div>
          <ul v-if="results.length" class="search-results list">
            <li v-for="(result, index) in results" :key="index" :data-index="index">
              <a :href="result.url"
                :class="['search-results__link', { 'active': index == indexHighlighted }]">
                {{ result.title }}
              </a>
            </li>
          </ul>
          <div v-else-if="noResults" class="search__empty">
            {{ I18n.t('search.no_results') }}
          </div>
        </div>
        <div class="search__footer">
          <img src="~images/search-by-algolia.svg" class="search__sponsor">
        </div>
      </div>
    </transition>
  </li>
</template>

<script>
import Vue from 'vue';
import { mixin as clickaway } from 'vue-clickaway';
import algoliasearch from 'algoliasearch/lite';
import debounce from 'lodash.debounce';

import icon from 'components/icon';

export default Vue.component('search', {
  mixins: [clickaway],

  components: {
    icon,
  },

  data() {
    return {
      query: '',
      results: [],
      noResults: false,
      displayed: false,
      indexHighlighted: null,
      I18n: window.I18n
    }
  },

  mounted() {
    const { appId, apiKey } = Cookr.config.algolia;
    this._client = algoliasearch(appId, apiKey);
    this._index = this._client.initIndex(`Recipe_${Cookr.env}`);

    document.addEventListener('click', this.handle)
  },

  watch: {
    query() {
      this.search();
    },

    displayed() {
      if (this.displayed) {
        this.$nextTick(() => {
          this.$refs.field.focus();
        });
      }
    }
  },

  methods: {
    toggle() {
      this.displayed = !this.displayed;
    },

    hide() {
      this.displayed = false;
    },

    search: debounce(function() {
      if (this.query.length < 2) {
        this.setResults([]);
        return;
      }

      this._index.search({
        query: this.query,
        hitsPerPage: 5,
      }, (err, content) => {
        if (err) throw err;
        this.setResults(content.hits);
      });
    }, 200),

    setResults(results) {
      this.results = results;
      this.noResults = !!this.results.length;
    },

    moveDown() {
      if (this.indexHighlighted === this.results.length - 1) {
        return;
      }

      this.indexHighlighted = this.indexHighlighted !== null ? this.indexHighlighted + 1 : 0;
    },

    moveUp() {
      if (this.indexHighlighted === 0) {
        return;
      }

      const index = this.indexHighlighted !== null ? this.indexHighlighted : this.results.length;
      this.indexHighlighted = index - 1;
    },

    go() {
      const item = this.results[this.indexHighlighted];
      if (item) {
        window.location.replace(item.url);
      }
    },
  }
});
</script>
