import Axios from 'axios'

const axios = Axios.create({
  // baseURL: 'https://classi-api.herokuapp.com/',
  // baseURL: 'http://localhost:3000/',
  baseURL: 'http://192.168.2.33:3000/',
  timeout: 10000
})

export default axios
