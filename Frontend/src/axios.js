import Axios from 'axios'

const axios = Axios.create({
  baseURL: '',
  timeout: 10000
})

export default axios
