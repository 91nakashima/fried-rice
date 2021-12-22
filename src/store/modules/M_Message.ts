import { getFirestore, collection, onSnapshot } from 'firebase/firestore'

function initialState () {
  return {
    data: [] // firestore data
  }
}

export default {
  namespaced: true,

  state: initialState(),

  getters: {
    getMessageData: (state: any) =>
      state.data.sort((a: any, b: any) => {
        return Number(a.id) - Number(b.id)
      })
  },

  mutations: {
    initData (state: any, value: Array<any>) {
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
        const haveData: Array<any> = state.data || []

        snapshot.docChanges().forEach(change => {
          haveData.push(change.doc.data())
        })

        commit('initData', haveData)
      })
    }
  }
}
