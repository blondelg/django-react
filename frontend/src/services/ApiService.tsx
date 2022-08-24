import {
  IAuthTokens,
  TokenRefreshRequest,
  applyAuthTokenInterceptor,
} from "axios-jwt"
import axios from "axios"
import {
  isLoggedIn,
  setAuthTokens,
  clearAuthTokens,
  getAccessToken,
  getRefreshToken,
} from "axios-jwt"

const BASE_URL = "http://localhost:8000/api"

export const axiosInstance = axios.create({ baseURL: BASE_URL })

const requestRefresh: TokenRefreshRequest = async (
  refreshToken: string
): Promise<IAuthTokens | string> => {
  const response = await axios.post(
    `${BASE_URL}/token/refresh/`,
    { token: refreshToken },
    {
      headers: {
        "Content-Type": "application/json",
      },
    }
  )

  return {
    accessToken: response.data.access,
    refreshToken: response.data.refresh,
  }
}

interface LoginRequest {
  username: string
  password: string
}

export const login = async (params: LoginRequest) => {
  const response = await axiosInstance.post("/token/", params)

  console.log("LOGIN RESPONSE", response)

  setAuthTokens({
    accessToken: response.data.access_token,
    refreshToken: response.data.refresh_token,
  })
}

const logout = () => clearAuthTokens()

applyAuthTokenInterceptor(axiosInstance, { requestRefresh })

export class Params {[key: string]: string}

export class ApiService {
  get(url: string, params = new Params()) {
    return axiosInstance.get(url, {params: params})
  }

  post(url: string, object: object) {
    return axiosInstance.post(url, object)
  }

  put(url: string, object: object) {
    return axiosInstance.put(url, object)
  }

  delete(url: string, object: object) {
    return axiosInstance.delete(url)
  }

}
