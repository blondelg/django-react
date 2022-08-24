import { IAuthTokens, TokenRefreshRequest, applyAuthTokenInterceptor } from 'axios-jwt'
import axios from 'axios'

const BASE_URL = 'https://api.example.com'

export const axiosInstance = axios.create({ baseURL: BASE_URL })

const requestRefresh: TokenRefreshRequest = async (refreshToken: string): Promise<IAuthTokens | string> => {
  const response = await axios.post(`${BASE_URL}/auth/refresh_token`, { token: refreshToken })

  // If your backend supports rotating refresh tokens, you may also choose to return an object containing both tokens:
  // return {
  //  accessToken: response.data.access_token,
  //  refreshToken: response.data.refresh_token
  //}

  return response.data.access_token
}

// 3. Add interceptor to your axios instance
applyAuthTokenInterceptor(axiosInstance, { requestRefresh })

export class ApiService {

    get() {

    }

    post() {

    }

    put() {

    }

    delete() {

    }
    
}
