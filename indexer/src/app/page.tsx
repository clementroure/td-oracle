import { ConnectButton } from '../components/ConnectButton'
import { Connected } from '../components/Connected'
import { TokenDashboard } from '../components/TokenDashboard'
import React from 'react'

const Page: React.FC = () => {
  return (
    <>

      <div className="text-center pt-6 pb-6 font-bold text-2xl ">
        TD Indexer
      </div>

      <div className="flex justify-center items-center pb-4">
        <div className="display-flex">
          <ConnectButton />
        </div>
      </div>


      <Connected>

        <div className="text-center pt-12 pb-6 font-bold text-2xl ">
          3 biggest whales of a Sushiswap pool using TheGraph
        </div>

        <TokenDashboard />
        <br />
      </Connected>

    </>
  )
}

export default Page
