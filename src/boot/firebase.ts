import * as firebase from 'firebase/app'
import * as firestore from 'firebase/firestore'
import { getAuth, onAuthStateChanged } from 'firebase/auth'

export default ({ app, router, store }: any) => {
  function init () {
    const auth = getAuth()

    onAuthStateChanged(auth, user => {
      if (user) {
        console.log(user.uid)
      } else {
        console.log('ふむふむ')
      }
    })
    store.dispatch('M_Message/getDocs')
  }

  if (window && window.cordova) {
    document.addEventListener('deviceready', init, false)
  } else {
    init()
  }

  store.$firebase = firebase
  store.$firestore = firestore
}
