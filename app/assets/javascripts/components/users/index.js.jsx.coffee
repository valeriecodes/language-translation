@UsersIndexBox = React.createClass
  getInitialState: ->
    users: @props.users
    organizations: @props.organizations
    admins: @props.admins
    volunteers: @props.volunteers
    contributors: @props.contributors
  handleUserApproval: (userdata) ->
    approveurl = 'members/approve.json'
    disapproveurl = 'members/disapprove.json'
    if userdata.action == 'approve'
      $.ajax({
        url: approveurl
        dataType: 'json'
        type: 'POST'
        data: {user_id: userdata.user_id}
        success: ((data) ->
          @setState({users: data.users})).bind(this)
        error: ((xhr, status, err) ->
          console.error(approveurl, status, err.toString())).bind(this)
      })
    else if userdata.action == 'disapprove'
      $.ajax({
        url: disapproveurl
        dataType: 'json'
        type: 'POST'
        data: {user_id: userdata.user_id}
        success: ((data) ->
          @setState({users: data.users})).bind(this)
        error: ((xhr, status, err) ->
          console.error(disapproveurl, status, err.toString())).bind(this)
      })
  render: ->
    users = @state.users
    organizations = @state.organizations
    admins = @state.admins
    volunteers = @state.volunteers
    contributors = @state.contributors

    `<div className="UsersIndexBox">
      <h3>Members</h3>
      <UsersIndexList users={users} organizations={organizations} admins={admins} volunteers={volunteers}
        contributors={contributors} onUserApproval={this.handleUserApproval}/>
    </div>`


@UsersIndexList = React.createClass
  handleApproval: (data) ->
    @props.onUserApproval(data)
  render: ->
    clickApproval = @handleApproval
    organizations = @props.organizations
    admins = @props.admins
    volunteers = @props.volunteers
    contributors = @props.contributors
    userNodes = @props.users.map((user) ->
      organization = organizations[user.organization_id - 1]
      role =
        if (user.id in admins) then 'Admin'
        else if (user.id in volunteers) then 'Volunteer'
        else if (user.id in contributors) then 'Contributor'
        else 'Guest'
      `<UserNode key={user.id} user={user} organization={organization} role={role} onUserApproval={clickApproval}/>`)

    `<table className="UserIndexList table table-striped">
      <thead>
        <tr>
          <th>Organization</th>
          <th>Name</th>
          <th>Gender</th>
          <th>Email</th>
          <th>Username</th>
          <th>Location</th>
          <th>Language</th>
          <th>Mobile</th>
          <th>Role</th>
          <th>Login Approval</th>
        </tr>
      </thead>
      <tbody>{userNodes}</tbody>
    </table>`


@UserNode = React.createClass
  getInitialState: ->
    showModal: false
  closeModal: ->
    @setState({ showModal: false })
  openModal: ->
    @setState({ showModal: true })
  handleApproval: ->
    @closeModal()
    user = @props.user
    if user.login_approval_at
      @props.onUserApproval({user_id: user.id, action: 'disapprove'})
    else
      @props.onUserApproval({user_id: user.id, action: 'approve'})
  render: ->
    modal_message =
      if @props.user.login_approval_at
        "Are you sure that you want to disapprove '" + @props.user.username + "' from signing in?"
      else
        "Are you sure that you want to approve '" + @props.user.username + "' to sign in?"
    modal =
      `<Modal show={this.state.showModal} onHide={this.closeModal}>
        <Modal.Header closeButton>
          Are you sure?
        </Modal.Header>
        <Modal.Body>
          {modal_message}
        </Modal.Body>
        <Modal.Footer>
          <Button onClick={this.closeModal}>No</Button>
          <Button onClick={this.handleApproval} bsStyle='primary'>Yes</Button>
        </Modal.Footer>
      </Modal>`

    login_approval =
      if @props.user.login_approval_at
        `<div>
          {this.props.user.login_approval_at.slice(0,10)}
          <button onClick={this.openModal} className='btn btn-default'>
            <span className='glyphicon glyphicon-remove' />
          </button>
          {modal}
        </div>`
      else
        `<div>
          Waiting
          <button onClick={this.openModal} className='btn btn-default'>
            <span className='glyphicon glyphicon-ok' />
          </button>
          {modal}
        </div>`

    show_url = "members/" + @props.user.id

    `<tr>
      <td>{this.props.organization.name}</td>
      <td><a href={show_url}>{this.props.user.first_name} {this.props.user.last_name}</a></td>
      <td>{this.props.user.gender}</td>
      <td>{this.props.user.email}</td>
      <td>{this.props.user.username}</td>
      <td>{this.props.user.location}</td>
      <td>{this.props.user.lang}</td>
      <td>{this.props.user.contact}</td>
      <td>{this.props.role}</td>
      <td>{login_approval}</td>
    </tr>`
