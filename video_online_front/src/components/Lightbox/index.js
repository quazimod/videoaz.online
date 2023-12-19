/* eslint-disable react/prop-types */
import FslightboxReact from 'fslightbox-react'
import React from 'react'

export default class Lightbox extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      toggler: false,
      slide: 0
    }
  }

  openLightboxOnSlide(number) {
    this.setState({
      toggler: !this.state.toggler,
      slide: number
    })
  }

  render() {
    return <FslightboxReact
      toggler={ this.state.toggler }
      sources={ this.props.items }
      slide={ this.state.slide }
      types={ [ ...new Array(this.props.items.length).fill('image') ] }
    />
  }
}