https://forums.computercraft.cc/index.php?topic=629.0

I've been looking around the internet recently, and I've found that people have been wondering about projectile trajectory and ballistic calculators in Create: Big Cannons (CBC) for a while, as such, here is the summary/collection of my findings in this topic.

1. Formulas and Calculations
As of the posting date, CBC calculates the trajectory of shells by brute forcing all possible angles, however, the formula for calculating the actual angles through direct methods is hidden deep in the code. 

As such, some Redditors have tried to extract information for calculation from the source code, and here are their results:
Gravity: 0.05 blocks / tick
Drag: 0.99 per tick
Minimal spread (depends on the amount of barrels):
0.1 for nether-steel, 0.5 for steel, 1.25 for cast iron and 1.5 for wrought iron
[spread is calculated the same way as for arrows and other minecraft projectiles], Source: here


They have also managed to extract the calculation code and formulas from the source code of CBC:

CodeSelect Expand
Vec3 uel = this.getDeltaMovement();
Vec3 vel = uel;
Vec3 oldPos = this.position();
Vec3 newPos = oldPos.add(vel);
if (!this.isNoGravity()) vel = vel.add(0.0d, this.getGravity(), 0.0d);
vel = vel.scale(this.getDrag());
this.setDeltaMovement(vel);
Vec3 position = newPos.add(vel.subtract(uel).scale(0.5));
this.setPos(position);Vec3 uel = this.getDeltaMovement();
Vec3 vel = uel;
Vec3 oldPos = this.position();
Vec3 newPos = oldPos.add(vel);
if (!this.isNoGravity()) vel = vel.add(0.0d, this.getGravity(), 0.0d);
vel = vel.scale(this.getDrag());
this.setDeltaMovement(vel);
Vec3 position = newPos.add(vel.subtract(uel).scale(0.5));
this.setPos(position);


However, as brute forcing is quite inefficient, some genius Redditors (u/12PAIN) who posses advanced knowledge of trigonometry have helped to develop advanced formulas for DIRECTLY calculating projectile trajectories.

Here is the link to the original post: https://www.reddit.com/r/CreateMod/comments/1bbfhc5/big_cannons_math_of_projectiles_how_to_get_pitch/
(12PAIN states the reason for deriving this formula is to run it on CC computers, as they have less memory and power)

Calculating using this formula is much more efficient, having a big O notation of O(n), whereas brute forcing has a big O notation of O(n*k).
Thus, the DPTCF (Direct Projectile Trajectory Formula) is vastly more efficient.



2. Ballistic Calculator Apps
Now, how can we use our knowledge of these formulas?

Currently, there are 3 mainstream ballistic calculators:
SpaceEye's and Autist69420's Calculator (CCBC)
@Malex#6461's (CBC Discord) Calculator (PBC)
Mr_KWKD's Calculator (CCYTBC)

Please note that CCBC and PBC use the brute force method, which may be inefficient.
Currently, no one has managed to make a calculator using DPTCF.

CCYTBC is the only calculator known to have a YouTube tutorial/demonstration.
The link is here: https://www.youtube.com/watch?v=rZvFwNREg_A

It is stated that CCBC and CCYTBC are the only ones which run on Lua and can be used with a CC computer in-game.
PBC, however, is an external app, which must be installed separately and ran outside minecraft on an actual computer.

The links to the downloads are:
PBC: https://github.com/Malex21/CreateBigCannons-BallisticCalculator
CCBC: https://gist.github.com/SuperSpaceEye/c33443213605d1bf35f81737c9058dc2

CCYTBC has not been released according to my findings. It is also the most bare-bones calculator, as it does not account for Y axis.

There is also a tutorial on how to calculate trajectory manually using Desmos, here: https://www.youtube.com/watch?v=GfI5tZFmdE8


3. Limitations and Accuracy
The accuracy of the ballistic calculators are currently unknown, more research is required.
However, I have some estimations.

PBC probably has the highest accuracy as it has the highest computational power available, enabling it to run more iterations.
CCBC has been tested by me, and its Yaw is identical to PBC, but the Pitch, Airtime, and Fuze-times are off by quite a bit.

CCYTBC probably has the worst accuracy, as in the tutorial video it completely misses with even a small distance between cannon and target.

It is worth noting that the further the distance, the worse the accuracy (applies to all calculators)
 
The biggest limitation however is the cannon mount itself, as it only allows adjusting the angles up to 3 digits (ex. 19.2 or 20.4)

This Reddit thread talks about the same limitation: https://www.reddit.com/r/CreateMod/comments/16omb9b/how_to_calculate_degrees_in_create_big_cannons/

That is the end of my findings, if you have any ideas/corrections, please reply!

----
"You know how we might have caused a chain reaction that could destroy the world?"
"Yes, I remember it well."
"I think we have...."

Seriously, though, minecraft tech mods have become so advanced!
PS. I disappeared for a long while because I was playing HBM's NTM, ¯\_(ツ)_/¯.
There is also a mod to add CCBC as a treasure disk, here.
1 person likes this.
"Code is read much more often than it is written."
– Guido Van Rossum, creator of Python
