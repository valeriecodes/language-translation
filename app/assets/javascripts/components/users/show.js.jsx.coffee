@UsersShowBox = React.createClass
  getInitialState: ->
    data: @props.data

  render: ->
    user = @state.data.user

    organization = @state.data.organization

    gender = ''

    login_approval_message =
      if user.login_approval_at then ''
      else 'The user first needs to be approved to use the account.'

    `<div className="UsersShowBox">
      <h2>Contact Information</h2>
      <br/>
      <dl className="dl-horizontal">
        <dt>Organization</dt>
        <dd>{organization.name}</dd>

        <dt>Name</dt>
        <dd>{user.first_name} {user.last_name}</dd>

        <dt>Email</dt>
        <dd>{user.email}</dd>

        <dt>Location</dt>
        <dd>{user.location}</dd>

        <dt>Language</dt>
        <dd>{user.lang}</dd>

        <dt>Contact Number</dt>
        <dd>{user.contact}</dd>
      </dl>
      <p className="text-center"><strong>{login_approval_message}</strong></p>
    </div>`
