import axios from 'axios'

const apiKey = '?api_key=2305a8c76071ed723085da1129ee957508678790';
const fields = '&field_list=name,start_year,publisher,id,image,count_of_issues&format=json&filter=';
export default {
    data() {
        return {}
    },
    searchVolumes(nameQuery, publisherQuery, yearStartQuery) {
        nameQuery = 'name:' + nameQuery;
        publisherQuery = 'publisher:' + publisherQuery;
        yearStartQuery = 'start_year:' + yearStartQuery;
        return axios.get('http://comicvine.gamespot.com/api/volumes/' + apiKey + fields + nameQuery + ',' + publisherQuery + ',' + yearStartQuery);
    }
}

