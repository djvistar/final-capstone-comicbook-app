import axios from 'axios'


export default {
    data() {
        return {}
    },

       // Return single collection object when given Collection ID
       getCollection(collectionID) {
        return axios.get(`/collections/${collectionID}`);
    },

    // Return array of Issue IDs when given a Collection ID
    getIssuesFromCollection(collectionID) {
        return axios.get(`collections/${collectionID}/issues`);
    },

    // - - - - DONE
    // Return an array of Collection Objects for User requesting it
    getUserCollections() {
        return axios.get(`/collections`);
    },

    // Create a Collection when given a user ID and a collection object (name, issues)
    makeCollection(collectionObject) {
        return axios.push('/collections', collectionObject);
    },

    // Delete a Collection when given a Collection ID
    deleteCollection(collectionID) {
        return axios.delete(`collections/${collectionID}`);
    },

 





    // Add Issue to Collection when given IDs of both
    addIssueToCollection(issueID, collectionID) {
        return axios.post(`/collections/${collectionID}`, issueID);
    },

    // Delete Issue from Collection when given IDs of both
    removeIssueFromCollection(issueID, collectionID) {
        return axios.delete(`/collections/${collectionID}/${issueID}`);


    }
}

