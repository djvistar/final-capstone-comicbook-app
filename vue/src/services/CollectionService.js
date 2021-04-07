import axios from 'axios'


export default {
    data() {
        return {}
    },

    // Create a Collection when given a user ID and a collection object (name, issues)
    makeCollection(userID, collectionObject) {
        return axios.push();
    },

    // Delete a Collection when given a Collection ID
    deleteCollection(collectionID) {
        return axios.delete();
    },

    // Return single Collection object when given Collection ID
    getCollection(collectionID) {
        return axios.get();
    },

    // Return an array of Collection Objects when given a User ID
    getCollectionsByUser(userID){
        return axios.get();
    },
    
    // Return array of Issue IDs when given a Collection ID
    getIssuesFromCollection(collectionID){
        return axios.get();
    },

    // Add Issue to Collection when given IDs of both
    addIssueToCollection(issueID, collectionID) {
        return axios.post();
    },

    // Delete Issue from Collection when given IDs of both
    removeIssueFromCollection(issueID, collectionID) {
        return axios.delete();
    }
}

