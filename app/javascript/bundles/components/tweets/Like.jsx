import React from 'react'

export default class Like extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      count: this.props.count
    }
  }

  render() {
    if (this.state.count === 0) {
      return LikedTemplate(this.props)
    } else {
      return NotLikedTemplate(this.props)
    }
  }
}


function LikedTemplate (props) {
  return (
    <div class="ui labeled button" tabindex="0">
      <div class="ui red button">
        <i class="heart icon"></i> Like
      </div>
      <a class="ui basic red left pointing label">
        <span>
          { props.count }
        </span>
      </a>
    </div>
  )
}

function NotLikedTemplate (props) {
  return (
    <div class="ui labeled button" tabindex="0">
      <div class="ui button">
        <i class="heart icon"></i> Like
      </div>
      <a class="ui basic gray left pointing label">
        <span>
          { props.count }
        </span>
      </a>
    </div>
  )
}