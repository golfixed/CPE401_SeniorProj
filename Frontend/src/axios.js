import Axios from 'axios'

const axios = Axios.create({
  baseURL: 'http://localhost:8080',
  timeout: 10000
})

export default axios
