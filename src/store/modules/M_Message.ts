import {
  getFirestore,
  collection,
  onSnapshot,
  doc,
  setDoc
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
            haveData.push(change.doc.data())
          }
          if (change.type === 'modified') {
            // *更新
            const modifiedData: any = change.doc.data()
            haveData.map((d: mainData) => {
              if (d.id === modifiedData.id) {
                d = modifiedData
              }
              return d
            })
          }
          if (change.type === 'removed') {
            // *削除
            haveData = haveData.filter(
              (d: mainData) => d.id !== change.doc.data().id
            )
          }
        })

        commit('initData', haveData)
      })
    },

    setDoc ({ dispatch, rootState, state }: any, data: mainData) {
      data = {
        ...data,
        ...{
          created_at: new Date(),
          created_by: getAuth().currentUser?.uid
        }
      }
      const db = getFirestore()
      const newdata = doc(collection(db, 'M_Message'))
      return setDoc(newdata, data)
    }
  }
}
