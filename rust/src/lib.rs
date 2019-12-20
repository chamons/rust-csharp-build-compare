pub fn add_two (x: u32) -> u32
{
	x + 2
}

#[cfg(test)]
mod tests {
	use super::*;
	
	#[test]
	fn add ()
	{
		assert_eq!(8, add_two(6));	
	}
}