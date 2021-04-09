import axios from 'axios'


export default {
    data() {
        return {}
    },

    // Create a Collection when given a user ID and a collection object (name, issues)
    makeCollection(collectionObject) {
        return axios.push('/collections', collectionObject);
    },

    // Delete a Collection when given a Collection ID
    deleteCollection(collectionID) {
        return axios.delete(collectionID);
    },

    // Return single collection object when given Collection ID
    getCollection(collectionID) {
        return axios.get(`/collection/${collectionID}`);
    },

    // Return an array of Collection Objects when given a User ID
    getCollectionsByUser(userID){
        return axios.get(`/collections`);
    },
    
    // Return array of Issue IDs when given a Collection ID
    getIssuesFromCollection(collectionID){
        return axios.get();
    },

    // Add Issue to Collection when given IDs of both
    addIssueToCollection(issueID, collectionID) {
        return axios.post(`/collections/${collectionID}`, issueID);
    },

    // Delete Issue from Collection when given IDs of both
    removeIssueFromCollection(issueID, collectionID) {
        return axios.delete(`/collections/${collectionID}/${issueID});

        
    }
}

