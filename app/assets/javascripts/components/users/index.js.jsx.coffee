@UsersIndexBox = React.createClass
  getInitialState: ->
    data: @props.data
  render: ->
    `<div className="UsersIndexBox">
      <h3>Members</h3>
      <UsersIndexList data={this.state.data}/>
    </div>`

@UsersIndexList = React.createClass
  render: ->
    userNodes = @props.data.map((user) ->
      `<UserNode user={user} />`
    )
    `<table className="UserIndexList table table-striped">
      <tr>
        <th>Name</th>
        <th>Gender</th>
        <th>Email</th>
        <th>Username</th>
        <th>Location</th>
        <th>Language</th>
        <th>Mobile</th>
        <th>Login Approval</th>
      </tr>
      {userNodes}
    </table>`

@UserNode = React.createClass
  render: ->
    login_approval =
      if @props.user.login_approval_at
      then  `<div>{this.props.user.login_approval_at.slice(0,10)}<button className='btn btn-default'><span className='glyphicon glyphicon-remove' /></button></div>`
      else `<div>Waiting<button className='btn btn-default'><span className='glyphicon glyphicon-ok' /></button></div>`
    show_url = "members/" + @props.user.id
    `<div className="UserNode">
      <tr>
        <td><a href={show_url}>{this.props.user.first_name} {this.props.user.last_name}</a></td>
        <td>{this.props.user.gender}</td>
        <td>{this.props.user.email}</td>
        <td>{this.props.user.username}</td>
        <td>{this.props.user.location}</td>
        <td>{this.props.user.lang}</td>
        <td>{this.props.user.contact}</td>
        <td>{login_approval}</td>
      </tr>
    </div>`