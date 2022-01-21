import { registerPlugin } from '@capacitor/core'

interface PluginType {
  echo(options: { value: string }): Promise<{ value: string }>
  toNativePage(options: { value: string }): void
}

const Echo: PluginType = registerPlugin('Echo')

export default Echo

// ここを使う
// import Echo from '../helper/EchoPlugin'
// const test = async () => {
//   const value = await Echo.echo({ value: 'Hello World!' })
//   alert(value.value)
// }
// test()
