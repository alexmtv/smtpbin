: include header;

<div class='email'>

  <div class='header'>
    <span class='key'>From:</span>
    <span class='value'><a href='http://github.com/agjohnson'>aj@ohess.org</a></span>
  </div>

  <div class='header'>
    <span class='key'>To:</span>
    <span class='value'>postmaster@smtpbin.org</span>
  </div>

  <div class='header'>
    <span class='key'>Subject:</span>
    <span class='value'>Documentation on smtpbin</span>
  </div>

  <div class='header'>
    <span class='key'>X-Source:</span>
    <span class='value'><a href='http://github.com/agjohnson/smtpbin'>http://github.com/agjohnson/smtpbin</a></span>
  </div>

  <h2>Synopsis<br/>--------</h2>

  <p>Use smtpbin for email integration and bounce testing:</p>

  <ul>
    <li>Browsable mailbox for viewing incoming messages</li>
    <li>JSON API for delivery information and statistics</li>
    <li>Generate <i>5xx</i> and <i>4xx</i> errors per recipient</li>
  </ul>

  <h2>Usage<br/>-----</h2>

  <p style='white-space: normal;'>
    Mail bins collect statistics and store incoming messages for viewing in a
    browser. Mail bins are publicly viewable and stored messages expire after
    15 minutes. To store an incoming message in a mail bin, specify an
    <b><a href='#header-id'>X-Smtpbin-Id</a></b> header. Messages that aren't
    rejected due to recipient rejection will be stored for viewing.
  </p>

  <p style='white-space: normal;'>
    Claim a <a href='/view/bin/random'>random bin</a>, or <a href='/view/bin'>create one</a>
    manually.
  </p>

  <h2>Enpoints<br/>--------</h2>

  <p style='white-space: normal;'>
    The following endpoints are available for automating integration testing on
    SMTP services:
  </p>

  <ul>
    <li><a href='/bin/foobar'>/bin/:id</a> - return bin <b>id</b> as JSON</li>
    <li><a href='/bin/foobar/stats'>/bin/:id/stats</a> - return stats for bin <b>id</b> as JSON</li>
    <li><a href='/message/foobar'>/message/:id</a> - return message <b>id</b> as JSON</li>
  </ul>

  <h2>Recipients<br/>----------</h2>

  <p style='white-space: normal;'>
    Recipients are accepted or rejected based on the recipient extension,
    specified after the local part of the email address. The local part of the
    email is disregarded, only the extension and, if accepted, headers matter.
  </p>

  <dl class='doc'>
    <dt>foo@smtpbin.org, foobar<b>+250</b>@smtpbin.org, foo<b>+ok</b>@smtpbin.org</dt>
    <dd>
      Return okay (250) response from SMTP server. This will accept mail for
      processing. If additional headers are added, they will be processed at
      this stage.
    </dd>

    <dt>foo<b>+450</b>@smtpbin.org, foo<b>+defer</b>@smtpbin.org</dt>
    <dd>Return temporary failure, mailbox unavailable response.</dd>

    <dt>foo<b>+451</b>@smtpbin.org</dt>
    <dd>Return temporary local error response.</dd>

    <dt>foo<b>+452</b>@smtpbin.org</dt>
    <dd>Return temporary insufficient storage response</dd>

    <dt>foo<b>+500</b>@smtpbin.org, foo<b>+reject</b>@smtpbin.org</dt>
    <dd>Return mailbox unavailable response</dd>
  </dl>

  <h2>Headers<br/>-------</h2>

  <p style='white-space: normal;'>
    By specifying headers in the generated email, statistics can be generated
    and the message will be stored for a short period of time for viewing.
  </p>

  <a name='header-id'/>
  <dl class='doc'>
    <dt><b>X-SMTPbin-Id:</b> &lt;id&gt;</dt>
    <dd>
      Set the mail bin to <b>id</b>, which is an alphanumeric string of any
      reasonable length. This will store the message temporarily under the bin
      <b>id</b> list, which generates a list of messages viewable as plain,
      html, or raw text.
    </dd>

    <dt><b>X-SMTPbin-Policy:</b> &lt;policy&gt;</dt>
    <dd>
      Set the mail bin policy to <b>policy</b>, which is one of the following:
      <ul>
        <li><b>write</b> - save message to bin, for full integration tests</li>
        <li><b>count</b> - update stats for bin, don't save</li>
      </ul>
    </dd>
  </dl>

  <p><!--
 -->Regards,
    Anthony
    --
    aj@ohess.org
    <a href='http://ohess.org'>http://ohess.org</a>
  </p>

</div>

: include footer;
