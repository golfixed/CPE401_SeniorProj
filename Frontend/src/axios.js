import Axios from 'axios'

const axios = Axios.create({
  // baseURL: 'https://classi-api.herokuapp.com/',
  baseURL: 'http://localhost:3000/api/',
  // baseURL: 'http://192.168.2.33:3000/api/',
  timeout: 10000,
  headers: {
    "Content-type": "application/json"
  }
})

export default axios
