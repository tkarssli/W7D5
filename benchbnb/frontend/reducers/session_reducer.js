import React from 'react'
import { 
  RECEIVE_CURRENT_USER, 
  LOGOUT_CURRENT_USER 
} from './actions/session_actions'

export default sessionReducer = (state, action) => {
  switch (action.type) {
    case RECEIVE_CURRENT_USER:

    case LOGOUT_CURRENT_USER:
      
    default:
      return state
  }

}