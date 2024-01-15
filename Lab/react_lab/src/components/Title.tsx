import { css } from 'styled-system/css'
import { styled } from 'styled-system/jsx'

function Title(props: React.ComponentProps<typeof styled.h1>) {
  return (
    <styled.h1
      {...props}
      className={css({
        fontSize: 'xxx-large',
      })}
    >
      {props.children}
    </styled.h1>
  )
}

export default Title
