import Axios from 'axios'

const axios = Axios.create({
  baseURL: 'http://localhost:8081',
  timeout: 10000
})

export default axios
