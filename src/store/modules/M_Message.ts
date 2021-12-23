import { getFirestore, collection, onSnapshot } from 'firebase/firestore'

function initialState () {
  return {
    data: [] // firestore data
  }
}

type mainData = {
  id: string
  msg: string
  created_at: any
  created_by: string
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
        const haveData: Array<any> = state.data || []

        snapshot.docChanges().forEach(change => {
          // 削除
          // 追加
          // 更新
          // 追加はいいけど、それ以外は修正が必要
          haveData.push(change.doc.data())
        })

        commit('initData', haveData)
      })
    }
  }
}
