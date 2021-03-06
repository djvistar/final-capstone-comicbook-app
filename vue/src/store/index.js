import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if (currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {

    // token: 'true',
    token: currentToken || '',
    user: currentUser || {},
    volumeResults: [],
    activeVolume: 0,
    activeCollection: 0,
    activeIssue: 0,
    showAllCollections: true,
    currentCollection: [],
    issuesFromSearch: [],
    userCollections: [],
    collection222Contents: [
      {
        id: 1234,
        title: "HardCoded",
        number: 22,
        volumeName: "SpiderGuy",
        imageURL: "https://comicvine1.cbsistatic.com/uploads/scale_small/11/117763/2676366-amazingspiderman001.jpg",

      },
      {
        id: 5463,
        title: "HardCodedAgain",
        number: 23,
        volumeName: "SpiderGuy",
        imageURL: "https://comicvine1.cbsistatic.com/uploads/scale_small/11/117763/2676366-amazingspiderman001.jpg",

      },
      {
        id: 3256,
        title: "StillHardCoded",
        number: 25,
        volumeName: "SpiderGuy",
        imageURL: "https://comicvine1.cbsistatic.com/uploads/scale_small/11/117763/2676366-amazingspiderman001.jpg",

      },

    ],

    collection223Contents: [
      {
        id: 1,
        title: "HardCoded",
        number: 33,
        volumeName: "Fables",
        imageURL: "https://comicvine1.cbsistatic.com/uploads/scale_small/11/117763/2676366-amazingspiderman001.jpg",
      },
      {
        id: 2,
        title: "HardCodedAgain",
        number: 22,
        volumeName: "Fables",
        imageURL: "https://comicvine1.cbsistatic.com/uploads/scale_small/11/117763/2676366-amazingspiderman001.jpg",
      },
      {
        id: 3,
        title: "StillHardCoded",
        number: 44,
        volumeName: "Fables",
        imageURL: "https://comicvine1.cbsistatic.com/uploads/scale_small/11/117763/2676366-amazingspiderman001.jpg",
      },

    ]
  },
  mutations: {
    SET_ACTIVE_VOLUME(state, id) {
      state.activeVolume = id;
    },
    SET_ACTIVE_COLLECTION(state, id) {
      state.activeCollection = id;
    },
    ADD_COLLECTION(state, collection) {
      state.userCollections.push(collection);
    },
    LOAD_CURRENT_COLLECTION_CONTENT(state, collectionContent) {
      state.currentCollection = collectionContent;
    },

    DELETE_COLLECTION(state, id) {
      for (var i = 0; i < state.userCollections.length; i++) {
        if (state.userCollections[i].collectionId === id) {
          state.userCollections.splice(i, 1);
        }
      }
    },
    ADD_ISSUE_RESULTS(state, issues) {
      state.issuesFromSearch = issues;
    },

    TOGGLE_SHOW_ALL_COLLECTIONS(state) {
      state.showAllCollections = !state.showAllCollections;
    },

    RESET_SHOW_ALL_COLLECTIONS(state) {
      state.showAllCollections = true;
    },

    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user', JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      state.volumeResults = [];
      state.activeVolume = 0;
      state.activeCollection = 0;
      state.activeIssue = 0;
      state.showAllCollections = true;
      state.currentCollection = [];
      state.issuesFromSearch = [];
      state.userCollections = [];
      axios.defaults.headers.common = {};
    }
  }
})
