import {
  getFirestore,
  collection,
  onSnapshot,
  doc,
  addDoc,
  updateDoc
} from 'firebase/firestore'
import { getAuth } from 'firebase/auth'

function initialState () {
  return {
    data: [] // firestore data
  }
}

type mainData = {
  id: string
  msg: string
  created_at: any
  created_by: string | undefined
  updated_at: any
  updated_by: string
}

export default {
  namespaced: true,

  state: initialState(),

  getters: {
    getMessageData: (state: any) =>
      state.data.sort((a: mainData, b: mainData) => {
        return Number(a.id) - Number(b.id)
      })
  },

  mutations: {
    initData (state: any, value: Array<mainData>) {
      state.data = value
    },
    reset (state: any) {
      state.data = {}
    }
  },

  actions: {
    getDocs ({ dispatch, rootState, state, commit }: any) {
      const db = getFirestore()
      const q = collection(db, 'M_Message')
      onSnapshot(q, snapshot => {
        let haveData: Array<any> = state.data || []

        snapshot.docChanges().forEach(change => {
          if (change.type === 'added') {
            // *追加
            if (change.doc.data().id) {
              haveData.push(change.doc.data())
            }
          } else if (change.type === 'modified') {
            // *更新
            const modifiedData: any = change.doc.data()

            if (haveData.some((d: mainData) => d.id === modifiedData.id)) {
              haveData.map((d: mainData) => {
                if (d.id === modifiedData.id) {
                  d = modifiedData
                }
                return d
              })
            } else {
              haveData.push(change.doc.data())
            }
          } else if (change.type === 'removed') {
            // *削除
            haveData = haveData.filter(
              (d: mainData) => d.id !== change.doc.data().id
            )
          }
        })

        commit('initData', haveData)
      })
    },

    async setDocs ({ dispatch, rootState, state }: any, data: mainData) {
      data = {
        ...data,
        ...{
          created_at: new Date(),
          created_by: getAuth().currentUser?.uid || ''
        }
      }
      const db = getFirestore()
      const newdata = collection(db, 'M_Message')
      const getId: any = await addDoc(newdata, data)
      // IDを追加
      const addId = doc(db, 'M_Message', getId.id)
      return updateDoc(addId, { id: getId.id })
    }
  }
}
