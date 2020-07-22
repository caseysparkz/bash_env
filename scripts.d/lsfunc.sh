#!/bin/bash
### lsfunc: List all functions

printf 'Functions:\n-----\n';

( grep '###' ~/.bash/functions.d/* |

  grep -v 'sed' |

  grep -v 'grep'|

  sed -e 's/.*###\ //g'	-e '/bash_profile.d/d';

  printf '\n'

) |

column -t -s: 
