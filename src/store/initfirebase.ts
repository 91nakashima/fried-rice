import { initializeApp } from 'firebase/app'
import { getFirestore, enableIndexedDbPersistence } from 'firebase/firestore'

const config = {
  /** firebaseConfig */
}

function initFirebase () {
  initializeApp(config)
  const db = getFirestore()

  return new Promise((resolve, reject) => {
    enableIndexedDbPersistence(db, {})
      .then(resolve)
      .catch(err => {
        if (err.code === 'failed-precondition') {
          console.log('err')
        } else if (err.code === 'unimplemented') {
          console.log('err')
        }
      })
  })
}

export { initFirebase }
