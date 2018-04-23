import React from 'react'

export default class Like extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      user_id: this.props.user_id,
      tweet_id: this.props.tweet_id,
      count: this.props.count,
      like_id: this.props.like_id,
    }

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {

    if (this.state.like_id)
      this.sendDeleteRequest().then(
        () => {
          this.setState(prevState => ({
            count: prevState.count - 1,
            like_id: !prevState.like_id
          }));
        },
        () => {
          return "failed"
        }
      )
    else {
      this.sendPostRequest().then(
        () => {
          this.setState(prevState => ({
            count: prevState.count + 1,
            like_id: !prevState.like_id
          }));
        },
        () => {
          return "failed"
        }
      )
    }
  }

  sendPostRequest() {
    return $.ajax({
      url: "tweets/" + this.state.tweet_id + "/likes",
      type: 'POST',
      data: {
        user_id: this.state.user_id
      }
    })
  }

  sendDeleteRequest() {
    return $.ajax({
      url: "tweets/" + this.state.tweet_id + "/likes/" + this.state.like_id,
      type: 'DELETE',
      data: {
        user_id: this.state.user_id
      }
    })
  }

  // TODO: CSS in JSを入れたら、templateの切り替えにanimation入れたい
  render() {
    if (this.state.like_id) {
      return LikedTemplate(this.state.count, this.handleClick)
    } else {
      return NotLikedTemplate(this.state.count, this.handleClick)
    }
  }
}



function LikedTemplate (count, clickFunc) {
  return (
    <div class="ui labeled button" onClick={clickFunc}>
      <div class="ui red button">
        <i class="heart icon"></i> Like
      </div>
      <a class="ui basic red left pointing label">
        <span>
          { count }
        </span>
      </a>
    </div>
  )
}

function NotLikedTemplate (count, clickFunc) {
  return (
    <div class="ui labeled button" onClick={clickFunc}>
      <div class="ui button">
        <i class="heart icon"></i> Like
      </div>
      <a class="ui basic gray left pointing label">
        <span>
          { count }
        </span>
      </a>
    </div>
  )
}