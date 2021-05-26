import Axios from 'axios'

const axios = Axios.create({
  // baseURL: 'https://classi-api.herokuapp.com/',
  baseURL: 'http://localhost:5000/',
  timeout: 10000
})

export default axios
