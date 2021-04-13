import axios from 'axios'


export default {
    data() {
        return {}
    },

    // -> DONE
    // Return single collection object when given Collection ID
    getCollection(collectionID) {
        return axios.get(`/collections/${collectionID}`);
    },

    // -> DONE
    // Return array of Issue IDs when given a Collection ID
    getIssuesFromCollection(collectionID) {
        return axios.get(`collections/${collectionID}/issues`);
    },

    // -> DONE
    // Return an array of Collection Objects for User requesting it
    getUserCollections() {
        return axios.get(`/collections`);
    },

    // -> DONE
    // Create a Collection when given a user ID and a collection object (name)
    makeCollection(collectionObject) {
        return axios.post('/collections', collectionObject);
    },

    // -> DONE
    // Delete a Collection when given a Collection ID
    deleteCollection(collectionID) {
        return axios.delete(`collections/${collectionID}`);
    },







    // Add Issue to Collection when given IDs of both
    addIssueToCollection(collectionID, comic) {
        return axios.post(`/collections/${collectionID}`, comic);
    },

    // Delete Issue from Collection when given IDs of both
    removeIssueFromCollection(issueID, collectionID) {
        return axios.delete(`/collections/${collectionID}/${issueID}`);


    }
}

